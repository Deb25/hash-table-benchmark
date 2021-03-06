# Copyright 2014 The University of Edinburgh

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CC=oshcc
NHASH=160000
CFLAGS=-D NHASH=$(NHASH) -DPROGRESS_BAR -DUSE_AMO
LDFLAGS=

.PHONY: all clean

# link the files
all: shmemhash.o hashobj.o
	$(CC) $(LDFLAGS) shmemhash.o hashobj.o -o shmemhash-$(NHASH)

# compile commands
# shmemhash.o: shmemhash.c
# 	$(CC) $(CFLAGS) -c shmemhash.c
# 
# hashobj.o: hashobj.c
# 	$(CC) $(CFLAGS) -c hashobj.c

clean:
	@rm -f *.o shmemhash-$(NHASH)
