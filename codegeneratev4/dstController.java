public void slotHDKTSignin(final tagHDKTSignin tag, final String token) {
OnLineClassroomManager.getInstance().HDKTSignin(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTSigninResponse response = (tagHDKTSigninResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTSigninResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTLessonHeader(final tagHDKTLessonHeader tag, final String token) {
OnLineClassroomManager.getInstance().HDKTLessonHeader(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTLessonHeaderResponse response = (tagHDKTLessonHeaderResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTLessonHeaderResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTLessonQuestion(final tagHDKTLessonQuestion tag, final String token) {
OnLineClassroomManager.getInstance().HDKTLessonQuestion(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTLessonQuestionResponse response = (tagHDKTLessonQuestionResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTLessonQuestionResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
