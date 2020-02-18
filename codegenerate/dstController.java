public void slotHDKTSigninFromStudent(final tagHDKTSigninFromStudent tag, final String token) {
OnLineClassroomManager.getInstance().HDKTSigninFromStudent(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTSigninFromStudentResponse response = (tagHDKTSigninFromStudentResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTSigninFromStudentResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTQuestionSelectStudent(final tagHDKTQuestionSelectStudent tag, final String token) {
OnLineClassroomManager.getInstance().HDKTQuestionSelectStudent(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTQuestionSelectStudentResponse response = (tagHDKTQuestionSelectStudentResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTQuestionSelectStudentResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTWeixinVisitorLogin(final tagHDKTWeixinVisitorLogin tag, final String token) {
OnLineClassroomManager.getInstance().HDKTWeixinVisitorLogin(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTWeixinVisitorLoginResponse response = (tagHDKTWeixinVisitorLoginResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTWeixinVisitorLoginResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
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
public void slotHDKTStudentDeviceUpdate(final tagHDKTStudentDeviceUpdate tag, final String token) {
OnLineClassroomManager.getInstance().HDKTStudentDeviceUpdate(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTStudentDeviceUpdateResponse response = (tagHDKTStudentDeviceUpdateResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTStudentDeviceUpdateResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTQuestionFileUpload(final tagHDKTQuestionFileUpload tag, final String token) {
OnLineClassroomManager.getInstance().HDKTQuestionFileUpload(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTQuestionFileUploadResponse response = (tagHDKTQuestionFileUploadResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTQuestionFileUploadResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTLessonSyncOver(final tagHDKTLessonSyncOver tag, final String token) {
OnLineClassroomManager.getInstance().HDKTLessonSyncOver(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTLessonSyncOverResponse response = (tagHDKTLessonSyncOverResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTLessonSyncOverResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTQuestionWriteSet(final tagHDKTQuestionWriteSet tag, final String token) {
OnLineClassroomManager.getInstance().HDKTQuestionWriteSet(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTQuestionWriteSetResponse response = (tagHDKTQuestionWriteSetResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTQuestionWriteSetResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
public void slotHDKTUpdateLessonTeacher(final tagHDKTUpdateLessonTeacher tag, final String token) {
OnLineClassroomManager.getInstance().HDKTUpdateLessonTeacher(new CloudInterface() {
@Override
public void cloudCallback(CloudResponseStatus arg0, Object arg1) {
tagHDKTUpdateLessonTeacherResponse response = (tagHDKTUpdateLessonTeacherResponse) arg1;
if (token == null) {
mFrmHomeOLCRControllerInterface.sendHDKTUpdateLessonTeacherResponse(response, token);
} else {
mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);
}
}
}, tag);
}
