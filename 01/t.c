#include <stdio.h>
#include <string.h>

int main(void) {
	char sentence[1024];

	while(fgets(sentence,1024,stdin) != NULL){
	
		if ((strlen(sentence) % 2) == 0){
		fputs(sentence, stdout);
		}
	}
	return 0;
}