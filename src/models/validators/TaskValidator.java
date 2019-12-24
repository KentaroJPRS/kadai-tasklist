package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Task;

public class TaskValidator {
    // バリデーションを実行する
    public static List<String> validate(Task t) {
        List<String> errors = new ArrayList<String>();

        String title_error = _validateTitle(t.getTitle());
        if(!title_error.equals("")) {
            errors.add(title_error);
        }

        String content_error = _validateContent(t.getContent());
        if(!content_error.equals("")) {
            errors.add(content_error);
        }

        String status_error = _validateStatus(t.getStatus());
        if(!status_error.equals("")){
            errors.add(status_error);
        }

        return errors;
    }

    // タスク名の必須入力チェック
    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タスク名を入力してください。";
        }

        return "";
    }

    // タスク内容の必須入力チェック
    private static String _validateContent(String content) {
        if(content == null || content.equals("")) {
            return "タスク内容を入力してください。";
        }

        return "";
    }

    private static String _validateStatus(Integer status) {
        if(status < 0 || 3 < status) {
            return "状態が正しく設定されていません。";
        }

        return "";
    }

}