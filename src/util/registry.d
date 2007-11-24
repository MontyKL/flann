module util.registry;


import algo.nnindex;
import dataset.features;
import util.utils;

import util.defines;


template IndexConstructor(T) {
	alias NNIndex function(Features!(T), Params) IndexConstructor;
}

template indexRegistry(T) {
	IndexConstructor!(T)[string] indexRegistry;
}

// alias NNIndex delegate(string) load_index_delegate;
// static load_index_delegate[string] loadIndexRegistry;


/*------------------- module constructor template--------------------*/

template AlgorithmRegistry(alias ALG,T)
{
	static this() 
	{
		indexRegistry!(T)[ALG.NAME] = function(Features!(T) inputData, Params params) {return cast(NNIndex) new ALG(inputData, params);};
	}
}

