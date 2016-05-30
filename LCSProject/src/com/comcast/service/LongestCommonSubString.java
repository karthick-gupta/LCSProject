package com.comcast.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.TreeSet;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.comcast.customexceptions.EmptyInputList;
import com.comcast.customexceptions.NonUniqueInputList;

public class LongestCommonSubString {
 
	public static String parseRequest(String inputJSON) throws JSONException, NonUniqueInputList, EmptyInputList {

		String lscString = null;

		TreeSet<String> lcsSet = new TreeSet<String>(new lengthCompare());

		JSONObject tempJSON = new JSONObject(inputJSON);
		JSONArray jsonarray = (JSONArray) tempJSON.get("setOfStrings");

		for (int i = 0; i < jsonarray.length(); i++) {

			tempJSON = jsonarray.getJSONObject(i);
			String name = tempJSON.getString("value");
			lcsSet.add(name);

		}

		lscString = lcsSet.first();

		if (jsonarray.length() != lcsSet.size()) {
			throw new NonUniqueInputList();
		} else if (jsonarray.length() == 1 && lscString.trim().length() == 0) {
			throw new EmptyInputList();
		}

		for (String s : lcsSet) {
			lscString = longestSubstring(lscString, s);
			System.out.println("For Loop" + s + lscString);
		}

		System.out.println("lscString" + lscString);

		return lscString;

	}

	public static String longestSubstring(String str1, String str2) {

		StringBuilder sb = new StringBuilder();

		if (str1 == null || str1.isEmpty() || str2 == null || str2.isEmpty()) {
			return "";
		}

		str1 = str1.toLowerCase();
		str2 = str2.toLowerCase();

		int[][] num = new int[str1.length()][str2.length()];

		int maxlen = 0;
		int lastSubsBegin = 0;

		for (int i = 0; i < str1.length(); i++) {
			for (int j = 0; j < str2.length(); j++) {
				if (str1.charAt(i) == str2.charAt(j)) {
					if ((i == 0) || (j == 0))
						num[i][j] = 1;
					else
						num[i][j] = 1 + num[i - 1][j - 1];

					if (num[i][j] > maxlen) {
						maxlen = num[i][j];

						int thisSubsBegin = i - num[i][j] + 1;
						if (lastSubsBegin == thisSubsBegin) {
							sb.append(str1.charAt(i));
						} else {
							lastSubsBegin = thisSubsBegin;
							sb = new StringBuilder();
							sb.append(str1.substring(lastSubsBegin, i + 1));
						}
					}
				}
			}
		}

		return sb.toString();
	}

}
