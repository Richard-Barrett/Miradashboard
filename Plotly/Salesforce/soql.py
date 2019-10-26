# SOQL Salesforce Application
# Environment: Python 2.7 or 3.7
# Created by: Richard Barrett
# Company: Mirantis
# Date Created: 08/01/2019
# Purpose: Application for SOQL Queries in Plotly Server
# ======================================================

# Documentation & References
# ===========================================
# https://pypi.org/project/simple-salesforce/
# ============================================

# Usages and Sample Commands:
# ======================================================================
# sf.query_all("SELECT Id, Email FROM Contact WHERE LastName = 'Jones'")
# ======================================================================

import dash
import dash_core_components as dcc
import dash_html_components as html
from pandas import DataFrame
from simple_salesforce import SalesforceAPI
sf = SalesforceAPI('###.com', '###', '###')
import pandas as pd


# Saleforce Secure Connection TBD
# ===============================
# sf_sec = Salesforce(username = username,
#               password = password,
#               security_token= token,
#               instance_url = instance,
#               sandbox = isSandbox)

# Function to Return Salesforce SOQL Queries as Dataframes
# =========================================================
def sql_query(query_str):
    qry_result = sf.query(query_str)
    print('Record Count {0}'.format(qry_result['totalSize']))
    is_done = qry_result['done']
    if is_done:
        df = DataFrame(qry_result['records'])
    while not is_done:
        try:
            if not qry_result['done']:
                df = df.append(DataFrame(qry_result['records']))
                qry_result = sf.query_more(qry_result['nextRecordsUrl'], True)
            else:
                df = df.append(DataFrame(qry_result['records']))
                is_done = True
                print('completed')
                break
        except NameError:
            df = DataFrame(qry_result['records'])
            sf.query_more(qry_result['nextRecordsUrl'], True)
    df = df.drop('attributes', axis=1)
    return df
soql_test = 'SELECT Milestone_violated__c, First_Reply__c, CaseNumber, Environment2__r.Name,' \
            ' Owner.Name, Severity_Level__c, Status, Subject, URL_for_support__c from Case'
#res = sql_query(soql_test)
#res.to_pickle('salesforce.bin')
res=pd.read_pickle('salesforce.bin').head(20)

print(type(res))

# SAMPLE SOQL COMMANDS
# ====================
# SOQL('SELECT Id FROM CASE')

def generate_table(dataframe, max_rows=10):
    return html.Table(
        # Header
        [html.Tr([html.Th(col) for col in dataframe.columns])] +

        # Body
        [html.Tr([
            html.Td(dataframe.iloc[i][col]) for col in dataframe.columns
        ]) for i in range(min(len(dataframe), max_rows))]
    )


external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

app.layout = html.Div(children=[
    html.H4(children='Salesforce Mirantis Data Overall'),
    #res.to_html()
    generate_table(res)
])

if __name__ == '__main__':
    app.run_server(debug=True)


# EOF
