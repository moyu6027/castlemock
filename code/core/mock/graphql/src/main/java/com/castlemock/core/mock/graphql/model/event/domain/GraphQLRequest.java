/*
 * Copyright 2018 Karl Dahlgren
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.castlemock.core.mock.graphql.model.event.domain;

import com.castlemock.core.basis.model.http.domain.HttpMethod;
import com.castlemock.core.basis.model.http.domain.HttpHeader;
import com.castlemock.core.mock.graphql.model.project.domain.GraphQLRequestQuery;
import org.dozer.Mapping;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * @author Karl Dahlgren
 * @since 1.19
 */
@XmlRootElement
public class GraphQLRequest {

    @Mapping("body")
    private String body;

    @Mapping("contentType")
    private String contentType;

    @Mapping("uri")
    private String uri;

    @Mapping("httpMethod")
    private HttpMethod httpMethod;

    @Mapping("queries")
    private List<GraphQLRequestQuery> queries;

    @Mapping("httpHeaders")
    private List<HttpHeader> httpHeaders;

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public HttpMethod getHttpMethod() {
        return httpMethod;
    }

    public void setHttpMethod(HttpMethod httpMethod) {
        this.httpMethod = httpMethod;
    }

    public List<GraphQLRequestQuery> getQueries() {
        return queries;
    }

    public void setQueries(List<GraphQLRequestQuery> queries) {
        this.queries = queries;
    }

    public List<HttpHeader> getHttpHeaders() {
        return httpHeaders;
    }

    public void setHttpHeaders(List<HttpHeader> httpHeaders) {
        this.httpHeaders = httpHeaders;
    }

}