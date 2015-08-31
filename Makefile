
all:
	docker run -it --rm \
	    -v ~/.bashrc:/root/.bashrc \
        -v ~/environment:/root/environment \
        -v ~/.ssh:/root/.ssh \
        $(IMAGE) /bin/bash
