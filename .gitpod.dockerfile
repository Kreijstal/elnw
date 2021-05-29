FROM losacademycos/latex-sage
USER root
COPY --from=sharelatex/sharelatex /var/www/sharelatex /var/www/sharelatex
COPY --from=sharelatex/sharelatex /var/lib/sharelatex /var/lib/sharelatex
RUN wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz &&\
cd redis-stable && make && make install && apt-get install -y python-pygments mongodb
#RUN apt-get install python-pygments
USER gitpod