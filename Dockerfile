FROM node:slim

#Initial setup
RUN apt-get update && apt-get install -y git python python-dev python-pip bzip2 build-essential
RUN pip install pandas
RUN pip install flask

#Add external dependencies
RUN mkdir files
ADD ./files ./files
ADD ./templates ./templates
ADD server.py ./
ADD wordCounter.py ./

#Clone main repo
RUN git clone https://github.com/kevincobain2000/jProcessing.git

#Install dependencies
RUN tar -zxvf ./files/CRF++-0.58.tar.gz -C ./files
RUN tar -zxvf ./files/mecab-0.996.tar.gz -C ./files
RUN tar -zxvf ./files/mecab-ipadic-2.7.0-20070801.tar.gz -C ./files
RUN tar -jxvf ./files/cabocha-0.69.tar.bz2 -C ./files

RUN cd ./files/CRF++-0.58 \
	&& ./configure \
	&& make \
	&& make install

RUN cd ./files/mecab-0.996 \
	&& ./configure --with-charset=utf8 \
	&& make \
	&& make check \
	&& make install \
	&& ldconfig

RUN cd ./files/mecab-ipadic-2.7.0-20070801 \
	&& ./configure --with-charset=utf8 \
	&& make \
	&& make check \
	&& make install

RUN cd ./files/cabocha-0.69 \
	&& ./configure --with-mecab-config=`which mecab-config` --with-charset=UTF8 \
	&& make \
	&& make check \
	&& make install \
	&& ldconfig
	
RUN cd ./jProcessing && python setup.py install

EXPOSE 8080

CMD ["python","server.py"]