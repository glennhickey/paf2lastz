CWD:=$(shell pwd)
CXX ?= g++

CXXFLAGS := -O3 -Werror=return-type -std=c++14 -g $(CXXFLAGS)

all: paf2lastz

paf2lastz: paf2lastz.o main.o
	$(CXX) $(INCLUDE_FLAGS) $(CXXFLAGS) $(CPPFLAGS) -o paf2lastz main.o paf2lastz.o

main.o:$(LIB_DEPS) main.cpp paf2lastz.hpp paf2lastz.hpp
	$(CXX) $(INCLUDE_FLAGS) $(CXXFLAGS) $(CPPFLAGS) -c main.cpp $(INC_FLAGS)

paf2lastz.o:$(LIB_DEPS) paf2lastz.cpp paf2lastz.hpp
	$(CXX) $(INCLUDE_FLAGS) $(CXXFLAGS) $(CPPFLAGS) -c paf2lastz.cpp $(INC_FLAGS)

clean:
	rm -rf paf2lastz main.o paf2lastz.o

test: mapqTest scoreTest
	rm -f test/out_mapq test/out_score

mapqTest:
	./paf2lastz test/evolver_rat.paf -q > test/out_mapq
	diff test/out_mapq test/evolver_rat_mapq.cigar
	echo "OK"

scoreTest:
	./paf2lastz test/evolver_rat.paf > test/out_score
	diff test/out_score test/evolver_rat_score.cigar
	echo "OK"
