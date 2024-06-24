#include <iostream>
#include <fstream>
#include <sstream>

std::string ReadFile(const std::string& path) {
	std::ifstream file(path);

	if (!file.is_open()) {
		std::stringstream strStream;
		strStream << "Cannot read file " << path << std::endl;
		throw strStream.str();
	}
	std::stringstream content;
	content << file.rdbuf();

	file.close();

	return content.str();
}

int main() {
	std::string assemblerOutputHackFile = "out.hack";
	std::string assemblyCompareFile = "add.asm";

	std::string assemblerOutputHackFileContent = ReadFile(assemblerOutputHackFile);
	std::string assemblyCompareFileContent = ReadFile(assemblyCompareFile);

	size_t assemblerOutputHackFileLen = assemblerOutputHackFileContent.length();
	size_t assemblyCompareFileContentLen = assemblyCompareFileContent.length();

	if (assemblerOutputHackFileLen < assemblyCompareFileContentLen) {
		std::cout << "Hack Assembler output file is shorter than the compare file" << std::endl;
		return 1;
	}
	else if (assemblerOutputHackFileLen > assemblyCompareFileContentLen) {
		std::cout << "Hack Assembler output file is longer than the compare file" << std::endl;
		return 1;
	}

	for (int i = 0; i < assemblyCompareFileContentLen; ++i) {
		if (assemblyCompareFileContent[i] != assemblerOutputHackFileContent[i]) {
			std::cout << "char " << i << " is different in the 2 files assembler output " << assemblyCompareFileContent[i] << " compare file output " << assemblerOutputHackFileContent[i] << std::endl;
			return 1;
		}
	}

	std::cout << "Success: Hack assembler output file is the same as Compare file" << std::endl;
}