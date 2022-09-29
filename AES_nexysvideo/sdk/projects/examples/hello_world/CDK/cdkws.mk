.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ wujian100_open-hello_world - BuildSet ]----------"

Project_Build:
	@make -r -f wujian100_open-hello_world.mk -j 6 -C  ./ 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@export CDKPath="D:/C-Sky/CDK" CDK_VERSION="V2.16.2" ProjectPath="F:/Nexysvideo_wujian100/AES_nexysvideo/sdk/projects/examples/hello_world/CDK/" && "F:/Nexysvideo_wujian100/AES_nexysvideo/sdk/projects/examples/hello_world/CDK/../../../../utilities//aft_build.sh" 
	@echo Done


clean:
	@echo "----------Cleaning project:[ wujian100_open-hello_world - BuildSet ]----------"

