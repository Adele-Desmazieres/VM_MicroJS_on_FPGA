NS=50000   # number of clock cycles (for simulation)

FLAGS=

all: vm


ECLAT_COMPILER=../eclat-compiler

TARGET_DIR="../target"

DEBUG=false

FLAGS=

vm: $(ECLAT_COMPILER)/eclat
	(cd $(ECLAT_COMPILER); ./eclat \
		     -arg=$(DEBUG) -relax -notyB \
		    $(FLAGS) \
	        ../vm/fail.ecl ../vm/value.ecl ../vm/ram.ecl ../vm/frames.ecl ../vm/vm.ecl ../vm/tests.ecl ../vm/main.ecl)

$(ECLAT_COMPILER)/eclat:
	(cd $(ECLAT_COMPILER); make)

simul:
	(cd $(TARGET_DIR); make NS=$(NS))

clean:
	(cd $(ECLAT_COMPILER) ; make clean)
	rm -f `find . -name "*.cmo"`
	rm -f `find . -name "*.cmi"`
	(cd $(TARGET_DIR); make clean)

