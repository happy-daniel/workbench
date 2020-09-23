mvn_install(){
	mvn clean install -DskipTests=true
}


delete_feature_branch(){
	if [ $# -eq 0 ]
	then
    		echo '请输入要删除分支名, 用法如下：'
    		echo "$0 feature_branch"
    		exit 0
	fi
	FEATURE_BRANCH=features/$1
	git checkout  master;
	git push origin --delete $FEATURE_BRANCH
}


create_feature_branch(){
	if [ $# -eq 0 ]
	then
	    echo '请输入新分支名, 用法如下：'
	    echo "$0 feature_branch"
	    return  0
	fi
	FEATURE_BRANCH=features/$1
	git checkout  master;
	git pull;
	git checkout -b $FEATURE_BRANCH;
	git push origin $FEATURE_BRANCH;
	git branch --set-upstream-to=origin/$FEATURE_BRANCH $FEATURE_BRANCH;
	git pull;
}