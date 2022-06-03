# Purpose

run and debug async_coroutine_example.cpp

# Create a docker image to later use

```bash
docker build -t debian_testing_with_latest_clang_and_gcc .
```

# Clean host keys
```bash
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:2222"
```

# Run Docker
```bash
#docker run -it --rm -v $PWD:/work  debian_testing_with_latest_clang_and_gcc
docker run -it --rm -v $PWD:/work --cap-add sys_ptrace -p 127.0.0.1:2222:22 --name latest_cpp_dev debian_testing_with_latest_clang_and_gcc 
```

# Compile it
```bash
clang++-14 -stdlib=libstdc++ -std=c++2b async_coroutine_example.cpp -lpthread
```

# Run it
```bash
./a.out
```

# Debug it

Use Clion to Remote Toolchain to debug it 

# A friendly way?

Attach VS Code to you container or by dev container?

# How to get llvm ir

```bash
#ref: https://stackoverflow.com/questions/9148890/how-to-make-clang-compile-to-llvm-ir
clang++-14 -std=c++2b -stdlib=libstdc++ -S -emit-llvm async_coroutine_example.cpp
clang++-14 -std=c++2b -stdlib=libstdc++ -S -emit-llvm corodemo.cc
```
# Others
```bash
#which not works
#g++ --std=c++2b -fcoroutines async_coroutine_example.cpp 
#clang++ -std=c++2b -fcoroutines-ts corodemo.cc 
```

# Ref:
1. https://twitter.com/lewissbaker/status/1528563836995125248
2. https://gist.github.com/lewissbaker/1eb070478e31372f97c1e71a0ecf0ce6
3. https://gist.github.com/lewissbaker/35acc4fe037ab67e0e2dce120c8e9bad
4. https://www.scs.stanford.edu/~dm/blog/c++-coroutines.html
5. https://www.scs.stanford.edu/~dm/blog/corodemo.cc
6. https://hub.docker.com/_/debian
7. https://docs.docker.com/engine/reference/commandline/container_inspect/
8. https://askubuntu.com/questions/1110828/ssh-failed-to-start-missing-privilege-separation-directory-var-run-sshd
9. https://github.com/JetBrains/clion-remote/blob/master/Dockerfile.remote-llvm-project-env
10. https://microsoft.github.io/code-with-engineering-playbook/developer-experience/devcontainers/
11. https://code.visualstudio.com/docs/remote/devcontainerjson-reference
12. https://code.visualstudio.com/docs/cpp/launch-json-reference
13. https://code.visualstudio.com/docs/cpp/enable-logging-cpp
14. https://code.visualstudio.com/docs/cpp/cpp-debug
15. https://code.visualstudio.com/docs/cpp/launch-json-reference
16. https://stackoverflow.com/questions/49583381/how-to-debug-a-cmake-make-project-in-vscode
17. https://vector-of-bool.github.io/docs/vscode-cmake-tools/debugging.html
18. https://code.visualstudio.com/docs/cpp/faq-cpp#_how-do-i-get-intellisense-to-work-correctly
19. https://stackoverflow.com/questions/9148890/how-to-make-clang-compile-to-llvm-ir
20. https://llvm.org/docs/Coroutines.html
