package model.Place;



import java.util.List;

public class RespParam {
    private String error_message;
    private List<String> html_attributions;
    private String next_page_token;
    private List<Results> results;
    private String status;

    private String type;
    private String start_place ;

    public String getStart_place() {
        return start_place;
    }

    public void setStart_place(String start_place) {
        this.start_place = start_place;
    }
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getError_message() {
        return error_message;
    }

    public void setError_message(String error_message) {
        this.error_message = error_message;
    }

    public List<String> getHtml_attributions() {
        return html_attributions;
    }

    public void setHtml_attributions(List<String> html_attributions) {
        this.html_attributions = html_attributions;
    }

    public List<Results> getResults() {
        return results;
    }

    public void setResults(List<Results> results) {
        this.results = results;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNext_page_token() {
        return next_page_token;
    }

    public void setNext_page_token(String next_page_token) {
        this.next_page_token = next_page_token;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof RespParam)) return false;

        RespParam respParam = (RespParam) o;

        if (!getError_message().equals(respParam.getError_message())) return false;
        if (!getHtml_attributions().equals(respParam.getHtml_attributions())) return false;
        if (!getResults().equals(respParam.getResults())) return false;
        return getStatus().equals(respParam.getStatus());
    }

    @Override
    public int hashCode() {
        int result = getError_message().hashCode();
        result = 31 * result + getHtml_attributions().hashCode();
        result = 31 * result + getResults().hashCode();
        result = 31 * result + getStatus().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "RespParam{" +
                "error_message='" + error_message + '\'' +
                ", html_attributions=" + html_attributions +
                ", results=" + results +
                ", status='" + status + '\'' +
                '}';
    }
}
