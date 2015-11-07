<%@ include file="../../../../includes.jspf"%>
<c:url var="operation_update_url"  value="/web/soap/project/${soapProjectId}/port/${soapPort.id}" />
<div class="content-top">
    <h1><spring:message code="soap.soapport.header.port" arguments="${soapPort.name}"/></h1>
    <div align="right">
        <sec:authorize access="hasRole('ADMIN') or hasRole('MODIFIER')">
        <a class="button-error pure-button" href="<c:url value="/web/soap/project/${soapProjectId}/port/${soapPort.id}/delete"/>"><i class="fa fa-trash"></i> <span><spring:message code="soap.soapport.button.deleteport"/></span></a>
        </sec:authorize>
    </div>
</div>
<div class="content-summary">
    <table class="formTable">
        <tr>
            <td class="column1"><label path="name"><spring:message code="soap.soapport.label.name"/></label></td>
            <td class="column2"><label path="name">${soapPort.name}</label></td>
        </tr>
    </table>
</div>

<h2 class="decorated"><span><spring:message code="soap.soapport.header.operations"/></span></h2>
<c:choose>
    <c:when test="${soapPort.soapOperations.size() > 0}">
        <form:form action="${operation_update_url}" method="POST"  commandName="soapOperationModifierCommand">
            <div class="table-frame">
                <table class="entityTable">
                    <col width="10%">
                    <col width="40%">
                    <col width="15%">
                    <col width="20%">
                    <col width="15%">
                    <tr>
                        <th><spring:message code="soap.soapport.column.selected"/></th>
                        <th><spring:message code="soap.soapport.column.name"/></th>
                        <th><spring:message code="soap.soapport.column.method"/></th>
                        <th><spring:message code="soap.soapport.column.responsestrategy"/></th>
                        <th><spring:message code="soap.soapport.column.soapMockResponseStatus"/></th>
                    </tr>
                    <c:forEach items="${soapPort.soapOperations}" var="soapOperation" varStatus="loopStatus">
                        <tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
                            <td><form:checkbox path="soapOperationIds" name="${soapOperation.id}" value="${soapOperation.id}"/></td>
                            <td><a href="<c:url value="/web/soap/project/${soapProjectId}/port/${soapPort.id}/operation/${soapOperation.id}"/>">${soapOperation.name}</a></td>
                            <td>${soapOperation.soapOperationMethod}</td>
                            <td><spring:message code="soap.type.responsestrategy.${soapOperation.soapResponseStrategy}"/></td>
                            <td><spring:message code="soap.type.soapoperationstatus.${soapOperation.soapOperationStatus}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <sec:authorize access="hasRole('ADMIN') or hasRole('MODIFIER')">
                <form:select path="soapOperationStatus">
                    <c:forEach items="${soapOperationStatuses}" var="operationStatus">
                        <form:option value="${operationStatus}"><spring:message code="soap.type.soapoperationstatus.${operationStatus}"/></form:option>
                    </c:forEach>
                </form:select>
                <button class="button-success pure-button" type="submit" name="action" value="update"><i class="fa fa-check-circle"></i> <span><spring:message code="soap.soapport.button.updatestatus"/></span></button>
                <button class="button-secondary pure-button" type="submit" name="action" value="update-endpoint"><i class="fa fa-code-fork"></i> <span><spring:message code="soap.soapport.button.updateendpoint"/></span></button>
            </sec:authorize>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form:form>
    </c:when>
    <c:otherwise>
        <spring:message code="soap.soapport.label.nooperation"/>
    </c:otherwise>
</c:choose>