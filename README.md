## Hash Compare

This ruby program uses OOP to compare two hashes for differences. Specifically, it:
* checks if the arguments passed in are hashes
* checks if the hashes are equal
* determines the unique keys in each hash
* determines shared keys
* determines if values for shared keys are different

 The program will check for differences between hashes at two levels - first level (shallow compare) and second level (deep compare) of a nested hash.

 Testing of the core compare methods was completed using RSpec. 

 **Limitations**

 This project was provided with a rough time constraint of approximately 2 hours. As such, in order to complete the goals of the challenge, I decided to narrow the scope to such that the deep compare only goes one level deeper, and only evaluates Hash class. As such, nested arrays were out of scope.

 **Improvements**

 With more time and consideration, this program would be designed to assess differences between hashes at all depths of a nested hash. 

**Files**

/lib
* hashes.rb is a module with four constants (hashes) that can be used to run the program
* hash_compare.rb contains class HashCompare with methods to compare hashes and output to console
* load_compare.rb contains class LoadCompare, which uses hashes.rb to instantiate and run HashCompare.

/spec
* hash_compare_spec.rb contains the test suite for class HashCompare. All tests pass.

**To Run**
* clone this repo and open the project directory in terminal and cd to /lib, then rub irb and enter `load 'load_compare.rb'`. 
* you can change the hashes being evaluated by modifying the module in 'hashes.rb'.
* you can run the deep or shallow compare by modifying the method call at the bottom of 'load_compare.rb'
