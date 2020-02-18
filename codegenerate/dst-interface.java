public void HDKTSigninFromStudent(final CloudInterface cloudInterface, final tagHDKTSigninFromStudent tagHDKTSigninFromStudent) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTSigninFromStudent, tagHDKTSigninFromStudentResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTSigninFromStudentResponse.class, tagHDKTSigninFromStudent);

return;
}

handleResponseEvent(cloudInterface, tagHDKTSigninFromStudent, responseBody, tagHDKTSigninFromStudentResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTSigninFromStudent.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTSigninFromStudent)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTQuestionSelectStudent(final CloudInterface cloudInterface, final tagHDKTQuestionSelectStudent tagHDKTQuestionSelectStudent) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTQuestionSelectStudent, tagHDKTQuestionSelectStudentResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTQuestionSelectStudentResponse.class, tagHDKTQuestionSelectStudent);

return;
}

handleResponseEvent(cloudInterface, tagHDKTQuestionSelectStudent, responseBody, tagHDKTQuestionSelectStudentResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTQuestionSelectStudent.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTQuestionSelectStudent)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTWeixinVisitorLogin(final CloudInterface cloudInterface, final tagHDKTWeixinVisitorLogin tagHDKTWeixinVisitorLogin) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTWeixinVisitorLogin, tagHDKTWeixinVisitorLoginResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTWeixinVisitorLoginResponse.class, tagHDKTWeixinVisitorLogin);

return;
}

handleResponseEvent(cloudInterface, tagHDKTWeixinVisitorLogin, responseBody, tagHDKTWeixinVisitorLoginResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTWeixinVisitorLogin.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTWeixinVisitorLogin)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTSignin(final CloudInterface cloudInterface, final tagHDKTSignin tagHDKTSignin) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTSignin, tagHDKTSigninResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTSigninResponse.class, tagHDKTSignin);

return;
}

handleResponseEvent(cloudInterface, tagHDKTSignin, responseBody, tagHDKTSigninResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTSignin.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTSignin)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTLessonHeader(final CloudInterface cloudInterface, final tagHDKTLessonHeader tagHDKTLessonHeader) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTLessonHeader, tagHDKTLessonHeaderResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTLessonHeaderResponse.class, tagHDKTLessonHeader);

return;
}

handleResponseEvent(cloudInterface, tagHDKTLessonHeader, responseBody, tagHDKTLessonHeaderResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTLessonHeader.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTLessonHeader)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTLessonQuestion(final CloudInterface cloudInterface, final tagHDKTLessonQuestion tagHDKTLessonQuestion) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTLessonQuestion, tagHDKTLessonQuestionResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTLessonQuestionResponse.class, tagHDKTLessonQuestion);

return;
}

handleResponseEvent(cloudInterface, tagHDKTLessonQuestion, responseBody, tagHDKTLessonQuestionResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTLessonQuestion.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTLessonQuestion)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTStudentDeviceUpdate(final CloudInterface cloudInterface, final tagHDKTStudentDeviceUpdate tagHDKTStudentDeviceUpdate) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTStudentDeviceUpdate, tagHDKTStudentDeviceUpdateResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTStudentDeviceUpdateResponse.class, tagHDKTStudentDeviceUpdate);

return;
}

handleResponseEvent(cloudInterface, tagHDKTStudentDeviceUpdate, responseBody, tagHDKTStudentDeviceUpdateResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTStudentDeviceUpdate.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTStudentDeviceUpdate)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTQuestionFileUpload(final CloudInterface cloudInterface, final tagHDKTQuestionFileUpload tagHDKTQuestionFileUpload) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTQuestionFileUpload, tagHDKTQuestionFileUploadResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTQuestionFileUploadResponse.class, tagHDKTQuestionFileUpload);

return;
}

handleResponseEvent(cloudInterface, tagHDKTQuestionFileUpload, responseBody, tagHDKTQuestionFileUploadResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTQuestionFileUpload.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTQuestionFileUpload)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTLessonSyncOver(final CloudInterface cloudInterface, final tagHDKTLessonSyncOver tagHDKTLessonSyncOver) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTLessonSyncOver, tagHDKTLessonSyncOverResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTLessonSyncOverResponse.class, tagHDKTLessonSyncOver);

return;
}

handleResponseEvent(cloudInterface, tagHDKTLessonSyncOver, responseBody, tagHDKTLessonSyncOverResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTLessonSyncOver.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTLessonSyncOver)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTQuestionWriteSet(final CloudInterface cloudInterface, final tagHDKTQuestionWriteSet tagHDKTQuestionWriteSet) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTQuestionWriteSet, tagHDKTQuestionWriteSetResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTQuestionWriteSetResponse.class, tagHDKTQuestionWriteSet);

return;
}

handleResponseEvent(cloudInterface, tagHDKTQuestionWriteSet, responseBody, tagHDKTQuestionWriteSetResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTQuestionWriteSet.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTQuestionWriteSet)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
public void HDKTUpdateLessonTeacher(final CloudInterface cloudInterface, final tagHDKTUpdateLessonTeacher tagHDKTUpdateLessonTeacher) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagHDKTUpdateLessonTeacher, tagHDKTUpdateLessonTeacherResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface, tagHDKTUpdateLessonTeacherResponse.class, tagHDKTUpdateLessonTeacher);

return;
}

handleResponseEvent(cloudInterface, tagHDKTUpdateLessonTeacher, responseBody, tagHDKTUpdateLessonTeacherResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagHDKTUpdateLessonTeacher.MethodName)).setRequestBody(DataUtils.beanToJson(tagHDKTUpdateLessonTeacher)).addRequestProperty(HEADER_AUTHORIZATION, mLoginToken).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
