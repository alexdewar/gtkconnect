OBJECTS := gtkconnect.o
SOURCES := $(OBJECTS:.o=.cpp)
DEPS    := $(OBJECTS:.o=.d)

CXXFLAGS += -Wall -Wextra -Wpedantic

.PHONY: all clean

all: gtkconnect

$(DEPS): $(SOURCES)
	$(CXX) -M -o $@ $<

-include $(DEPS)

$(OBJECTS): $(SOURCES) $(DEPS)
	$(CXX) -c $< $(CXXFLAGS)

gtkconnect: $(OBJECTS)
	$(CXX) -o $@ $< $(LDFLAGS)

clean:
	rm -f gtkconnect $(OBJECTS) $(DEPS)
