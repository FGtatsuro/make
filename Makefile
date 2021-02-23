.PHONY: submit
submit:
	# Manual build must pass COMMIT_SHA value.
	# Ref: https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values
	gcloud builds submit --substitutions=COMMIT_SHA=manual
