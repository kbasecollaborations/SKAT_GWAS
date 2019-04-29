FROM kbase/sdkbase2:python
MAINTAINER KBase Developer
# -----------------------------------------
# In this section, you can install any system dependencies required
# to run your App.  For instance, you could place an apt-get update or
# install line here, a git checkout to download code, or run any other
# installation scripts.

# RUN apt-get update


# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

WORKDIR /kb/module

RUN apt-get install -y netselect-apt

RUN rm /etc/apt/sources.list

RUN netselect-apt -o /etc/apt/sources.list

RUN apt-get update -y

RUN apt-get install -y r-base \
    && apt-get install -y vim

RUN pip install --upgrade pip \
	  && pip install --upgrade requests \
    && pip install -q pyvcf

RUN Rscript -e 'install.packages("SKAT", repos="http://cran.rstudio.com/")'
RUN Rscript -e 'install.packages("data.tables", repos="http://cran.rstudio.com/")'
RUN Rscript -e 'install.packages("qqman", repos="http://cran.rstudio.com/")'

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
