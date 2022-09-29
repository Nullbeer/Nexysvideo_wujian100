.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_open-hello_world - BuildSet ]----------"
	@
	@make -f "wujian100_open-hello_world.mk" MakeIntermediateDirs && make -f "wujian100_open-hello_world.mk" -j 6
	@echo Executing Post Build commands ...
	@export CDKPath="D:/C-Sky/CDK" ProjectPath="F:/Nexysvideo_wujian100/IO_LAB_nexysvideo/sdk/projects/examples/hello_world/CDK" && "F:/Nexysvideo_wujian100/IO_LAB_nexysvideo/sdk/projects/examples/hello_world/CDK//../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_open-hello_world - BuildSet ]----------"
	@make -f  "wujian100_open-hello_world.mk" clean
