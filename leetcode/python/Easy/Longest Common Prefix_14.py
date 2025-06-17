class Solution(object):
    def longestCommonPrefix(self, strs):
        if not strs:
            return ""
        prefix = strs[0]
        for word in strs[1:]:  
            i = 0
            while i < len(prefix) and i < len(word) and prefix[i] == word[i]:
                i += 1
            prefix = prefix[:i]  
            if prefix == "":
                return ""

        return prefix
