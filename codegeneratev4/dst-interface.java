public void HDKTSignin(final CloudInterface cloudInterface, final tagHDKTSignin tagHDKTSignin) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTSignin, tagHDKTSigninResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface);

return;
}

handleResponseEvent(cloudInterface, tagHDKTSignin, responseBody, tagHDKTSigninResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTSignin.MethodName)).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTLessonHeader(final CloudInterface cloudInterface, final tagHDKTLessonHeader tagHDKTLessonHeader) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTLessonHeader, tagHDKTLessonHeaderResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface);

return;
}

handleResponseEvent(cloudInterface, tagHDKTLessonHeader, responseBody, tagHDKTLessonHeaderResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTLessonHeader.MethodName)).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTLessonQuestion(final CloudInterface cloudInterface, final tagHDKTLessonQuestion tagHDKTLessonQuestion) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTLessonQuestion, tagHDKTLessonQuestionResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface);

return;
}

handleResponseEvent(cloudInterface, tagHDKTLessonQuestion, responseBody, tagHDKTLessonQuestionResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTLessonQuestion.MethodName)).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
