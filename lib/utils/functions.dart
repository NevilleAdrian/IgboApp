String replaceBackSlash(String url) =>
    url?.replaceAll('\\', '/')?.replaceAll(' ', '%020') ?? null;

bool isNullOrEmpty(String text) => text == null || text.trim() == '';

bool shouldShow(String question) =>
    !isNullOrEmpty(question) && !question.startsWith('#');
