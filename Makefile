
all:
	docker run -it --rm -v ~/.bashrc:/root/.bashrc -v ~/environment:/root/environment $(IMAGE) /bin/bash
