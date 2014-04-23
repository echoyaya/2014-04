DirectoryInfo dirTarget = new DirectoryInfo(targetPath);
            var query = from ele in dirTarget.GetFiles("*")
                        where ele.Name == filename
                        select ele;
            int count = query.Count();
            switch (count)
            {
                case 0: return "not exist";
                  
                default: return "exist";
                  
            }


IEnumerable<XElement> query = from elem in xdoc.Descendants("Corpus")  select elem;
================================
var query = from line in File.ReadAllLines(filepath + @"\Mobile_Cortana_BTEST_en-US_Selfhost_08-12-2013_Test_Server_Result_absolute_location.tst") select line;
