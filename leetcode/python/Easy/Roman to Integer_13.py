class Solution(object):
    def romanToInt(self, s):
        dic = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 
               'C': 100, 'D': 500, 'M': 1000}
        total = 0

        for i in range(len(s)):
            if i + 1 < len(s) and dic[s[i]] < dic[s[i + 1]]:
                total -= dic[s[i]]
            else:
                total += dic[s[i]]

        return total
