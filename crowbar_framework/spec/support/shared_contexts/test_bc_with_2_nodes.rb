# Copyright 2013, Dell 
# 
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at 
# 
#  http://www.apache.org/licenses/LICENSE-2.0 
# 
# Unless required by applicable law or agreed to in writing, software 
# distributed under the License is distributed on an "AS IS" BASIS, 
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
# See the License for the specific language governing permissions and 
# limitations under the License. 




shared_context "test barclamp with 2 nodes" do
    let(:deployment)  { 
      Barclamp.import 'test' unless Barclamp.find_by_name("test")
      barclamp = Barclamp.find_by_name("test")
      dep = barclamp.create_deployment "foo" 
      dep = barclamp.deployments.first if dep.nil?
      dep
    }

    let(:test_role1) { deployment.proposal.roles.first}
    let(:test_role2) { deployment.proposal.roles.second}

    before(:all) {            
      # add node
      test_role1.add_node(node1)
      test_role2.add_node(node2)
      deployment.commit()
    }
end
