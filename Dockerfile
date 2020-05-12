# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install software-properties-common -y

RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y \
        bc \
        time \
        bison \
        curl \
        flex \
        gcc-snapshot \
        gcc-8 \
        kmod \
        libelf-dev \
        libssl-dev \
        make \
        perl-modules \
        xz-utils \
        && \
    rm -rf /var/lib/apt/lists/* 

RUN ln -sfn /usr/bin/gcc-8 /usr/bin/gcc

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

CMD /entrypoint.sh
