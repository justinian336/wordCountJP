#! /usr/bin/env python 
# -*- coding: utf-8 -*-

from jNlp.jTokenize import jTokenize
import csv
import pandas as pd
import StringIO

def countWords(inputFileString):
    results = []
    encodedResults = []
    resultsColumns = ['word','count']
    
    csv_reader = csv.reader(StringIO.StringIO(inputFileString.encode('utf-8')),delimiter=",")
    for row in csv_reader:
        tokenized = jTokenize(unicode(row[0],'utf-8'))
        for token in tokenized:
            results.append(token)
    
    for word in results:
        encodedResults.append(word.encode('cp932'))
    
    series = pd.Series(encodedResults).value_counts()
    return pd.DataFrame(series)
    
