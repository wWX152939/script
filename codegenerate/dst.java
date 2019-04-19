public static final String METHOD_OLCR_GET_COURSE_IN_CLASS = "OLCRGetCourseInClass";
public static final String METHOD_OLCR_GET_COURSE_IN_CLASS_RESPONSE = "OLCRGetCourseInClassResponse";
public static final class tagOLCRGetCourseInClass extends tagRequestType {
public tagOLCRGetCourseInClass() {
MethodName = METHOD_OLCR_GET_COURSE_IN_CLASS;
}
}
public static final class OLCRGetCourseInClassData {
}
public static final class tagOLCRGetCourseInClassResponse extends
tagOLCRResponseType {
public tagOLCRGetCourseInClassResponse(String Caller) {
super(Caller);
MethodName = METHOD_OLCR_GET_COURSE_IN_CLASS_RESPONSE;
}
public OLCRGetCourseInClassData data;

}
public Signal sigOLCRGetCourseInClass = new Signal(tagOLCRGetCourseInClass.class, String.class);
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sigOLCRGetCourseInClass.connect(this, "slotOLCRGetCourseInClass");
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sigOLCRGetCourseInClass.disconnectReceiver(this);
public void slotOLCRGetCourseInClass(final tagOLCRGetCourseInClass tag, final String token) {
OnLineClassroomManager.getInstance().OLCRGetCourseInClass(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagOLCRGetCourseInClassResponse response = (tagOLCRGetCourseInClassResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendOLCRGetCourseInClassResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void sendOLCRGetCourseInClassResponse(tagOLCRGetCourseInClassResponse response, String token);
public void OLCRGetCourseInClass(final CloudInterface cloudInterface, final tagOLCRGetCourseInClass tagOLCRGetCourseInClass) {

if (DEBUG) {
handleResponseEventForDebug(cloudInterface, tagOLCRGetCourseInClass, tagOLCRGetCourseInClassResponse.class);
return;
}
NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {

@Override

public void getDataOnResult(int type, String responseBody) {

if (responseBody == null) {

setErrMsg(cloudInterface);

return;
}

handleResponseEvent(cloudInterface, tagOLCRGetCourseInClass, responseBody, tagOLCRGetCourseInClassResponse.class);
}
});

networkAsyncTask.setUrl(mUrlMap.get(tagOLCRGetCourseInClass.MethodName)).setRequestType(NetworkAsyncTask.TYPE_POST).execute();
}
------------------------------------------------------------------
