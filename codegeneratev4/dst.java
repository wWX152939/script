/**
*1.HDKTSignin
*/
public static final String METHOD_HDKT_SIGNIN_REQUEST = "HDKTSigninRequest";
public static final String METHOD_HDKT_SIGNIN_RESPONSE = "HDKTSigninResponse";
public static final class tagHDKTSigninRequest extends tagRequestType {
public tagHDKTSigninRequest() {
MethodName = METHOD_HDKT_SIGNIN_REQUEST;
}
}
public static final class tagHDKTSigninResponse extends
tagRequestType{
public tagHDKTSigninResponse(String Caller) {
super(Caller);
MethodName = METHOD_HDKT_SIGNIN_RESPONSE;
}
public int Result;

}
/**
*2.HDKTLessonHeader
*/
public static final String METHOD_HDKT_LESSON_HEADER_REQUEST = "HDKTLessonHeaderRequest";
public static final String METHOD_HDKT_LESSON_HEADER_RESPONSE = "HDKTLessonHeaderResponse";
public static final class tagHDKTLessonHeaderRequest extends tagRequestType {
public tagHDKTLessonHeaderRequest() {
MethodName = METHOD_HDKT_LESSON_HEADER_REQUEST;
}
}
public static final class tagHDKTLessonHeaderResponse extends
tagRequestType{
public tagHDKTLessonHeaderResponse(String Caller) {
super(Caller);
MethodName = METHOD_HDKT_LESSON_HEADER_RESPONSE;
}
public int Result;

}
/**
*3.HDKTLessonQuestion
*/
public static final String METHOD_HDKT_LESSON_QUESTION_REQUEST = "HDKTLessonQuestionRequest";
public static final String METHOD_HDKT_LESSON_QUESTION_RESPONSE = "HDKTLessonQuestionResponse";
public static final class tagHDKTLessonQuestionRequest extends tagRequestType {
public tagHDKTLessonQuestionRequest() {
MethodName = METHOD_HDKT_LESSON_QUESTION_REQUEST;
}
}
public static final class tagHDKTLessonQuestionResponse extends
tagRequestType{
public tagHDKTLessonQuestionResponse(String Caller) {
super(Caller);
MethodName = METHOD_HDKT_LESSON_QUESTION_RESPONSE;
}
public int Result;

}
