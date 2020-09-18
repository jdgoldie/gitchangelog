% if data["title"]:
# ${data["title"]}

% endif
% for version in data["versions"]:
<%
ver_tag = version["tag"] if version["tag"] else opts["unreleased_version_label"]
ver_date = version["date"]
ver_hash = version["commit"].sha1_short
title = "%s (%s - %s)" % (ver_tag, ver_date, ver_hash)
%>## ${title}
% for section in version["sections"]:

<% %>### ${section["label"]}  
% for commit in section["commits"]:
<%
subject = "%s [%s]" % (commit["subject"], ", ".join(commit["authors"]))
%>  * ${subject}
% endfor
% endfor

% endfor

