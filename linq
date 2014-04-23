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
