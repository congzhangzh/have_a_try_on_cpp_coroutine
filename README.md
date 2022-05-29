# Purpose

run and debug async_coroutine_example.cpp

# Create a docker image to later use

```bash
docker build -t debian_testing_with_latest_clang_and_gcc .
```

# Run Docker
```bash
docker run -it --rm -v $PWD:/work  debian_testing_with_latest_clang_and_gcc
```

# Compile it
```bash
clang++-14 -stdlib=libstdc++ -std=c++2b async_coroutine_example.cpp -lpthread
```

# Run it
```bash
./a.out
```

# Debug it?

# A firendly way?

Attach VS Code to you container?

# Others
```bash
#which not works
g++ --std=c++2b async_coroutine_example.cpp -fcoroutines
```

# Ref:
1. https://twitter.com/lewissbaker/status/1528563836995125248
2. https://gist.github.com/lewissbaker/1eb070478e31372f97c1e71a0ecf0ce6
3. https://gist.github.com/lewissbaker/35acc4fe037ab67e0e2dce120c8e9bad
4. https://hub.docker.com/_/debian