FROM losacademycos/latex-sage
USER root
RUN apt-get install python-pygments
USER gitpod