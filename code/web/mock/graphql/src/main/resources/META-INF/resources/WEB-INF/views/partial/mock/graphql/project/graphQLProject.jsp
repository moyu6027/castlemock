<%@ include file="../../../../includes.jspf"%>

<%--
  ~ Copyright 2018 Karl Dahlgren
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~   http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>

<c:url var="graphql_resource_update_url"  value="/web/graphql/project/${graphQLProject.id}" />
<div class="navigation">
    <ol class="breadcrumb">
        <li><a href="${context}/web"><spring:message code="general.breadcrumb.home"/></a></li>
        <li class="active"><spring:message code="graphql.graphqlproject.header.project" arguments="${graphQLProject.name}"/></li>
    </ol>
</div>
<div class="container">
    <section>
        <c:if test="${not empty upload}">
            <c:if test="${upload == 'success'}">
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong><spring:message code="graphql.graphqlimportdefinition.message.success.title"/></strong> <spring:message code="graphql.graphqlimportdefinition.message.success.body"/>
                </div>
            </c:if>
            <c:if test="${upload == 'error'}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong><spring:message code="graphql.graphqlimportdefinition.message.error.title"/></strong> <spring:message code="graphql.graphqlimportdefinition.message.error.body"/>
                </div>
            </c:if>
        </c:if>

        <div class="content-top">
            <div class="title">
                <h1><spring:message code="graphql.graphqlproject.header.project" arguments="${graphQLProject.name}"/></h1>
            </div>
            <div class="menu" align="right">
                <sec:authorize access="hasAuthority('ADMIN') or hasAuthority('MODIFIER')">
                    <a class="btn btn-success demo-button-disabled"  href="<c:url value="/web/graphql/project/${graphQLProject.id}/update"/>"><i class="fa fa-file"></i> <span><spring:message code="graphql.graphqlproject.button.updateproject"/></span></a>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle demo-button-disabled" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-upload"></i> <span><spring:message code="graphql.graphqlproject.button.upload"/> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/web/graphql/project/${graphQLProject.id}/import?type=SCHEMA"/>">Schema</a></li>
                        </ul>
                    </div>
                    <a class="btn btn-primary" href="<c:url value="/web/graphql/project/${graphQLProject.id}/export"/>"><i class="fa fa-cloud-download"></i> <span><spring:message code="graphql.graphqlproject.button.export"/></span></a>
                    <a class="btn btn-danger demo-button-disabled" href="<c:url value="/web/graphql/project/${graphQLProject.id}/delete"/>"><i class="fa fa-trash"></i> <span><spring:message code="graphql.graphqlproject.button.delete"/></span></a>
                </sec:authorize>
            </div>
        </div>
        <div class="content-summary">
            <table class="formTable">
                <tr>
                    <td class="column1"><label path="name"><spring:message code="graphql.graphqlproject.label.name"/></label></td>
                    <td class="column2"><label path="name">${graphQLProject.name}</label></td>
                </tr>
                <tr>
                    <td class="column1"><label path="description"><spring:message code="graphql.graphqlproject.label.description"/></label></td>
                    <td class="column2"><label path="description">${graphQLProject.description}</label></td>
                </tr>
                <tr>
                    <td class="column1"><label path="projectType"><spring:message code="graphql.graphqlproject.label.type"/></label></td>
                    <td class="column2"><label path="projectType">GraphQL</label></td>
                </tr>
            </table>
        </div>


        <h2 class="decorated"><span><spring:message code="graphql.graphqlproject.header.queries"/></span></h2>
        <c:choose>
            <c:when test="${graphqlProject.queries.size() > 0}">
                <form:form action="${graphql_resource_update_url}/" method="POST"  commandName="graphqlQueryModifierCommand">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover sortable">
                            <col width="10%">
                            <col width="40%">

                            <tr>
                                <th><spring:message code="graphql.graphqlproject.column.selected"/></th>
                                <th><spring:message code="graphql.graphqlproject.column.query"/></th>
                            </tr>

                            <c:forEach items="${graphqlProject.queries}" var="graphqlQuery" varStatus="loopStatus">
                                <tr>
                                    <td><form:checkbox path="graphqlQueriesIds" name="${graphqlQuery.id}" value="${graphqlQuery.id}"/></td>
                                    <td><a href="<c:url value="/web/graphql/project/${graphqlProject.id}/query/${graphqlQuery.id}"/>">${graphqlQuery.name}</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form:form>
            </c:when>
            <c:otherwise>
                <spring:message code="graphql.graphqlproject.label.noqueries"/>
            </c:otherwise>
        </c:choose> 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </section>
</div>