"""
Prompt construction for the four study conditions.

BASELINE reproduces, character for character, the prompt that
scripts/generate_variants.py in the Galápagos repo sends to GPT-4o
(including its typo "implementeation", the stray space before the period in
the C-to-C case, and the "int in C is equal to int32 in Go." remark).
Note that this differs slightly from the wording printed in Section 3.3 of
the paper; the code is what actually ran, so it is the baseline here.

CONTEXT_NOTES and COT_INSTRUCTIONS are DRAFTS for your team to edit. Keep
them identical across models so the only thing that changes is the model.
"""

# ---- verbatim from Galapagos/scripts/generate_variants.py -------------------
PROMPT_INTRO = 'The following code is a reference implementeation of a function in <INPUT>.'
PROMPT_INSTRUCTIONS = ('Create <NUMBER> substitute implementation(s) of the function, which are different '
                       'but equivalent <OUTPUT_LANG>. It should be possible to directly replace the function '
                       'and it should provide the same functionality')
OUTPUT_LANG_OPT = 'in the <OUTPUT> language'
REMARK_TYPES = "int in C is equal to int32 in Go."
REMARK_CODE_ONLY = "Do not output any other text apart from code."
REMARK_NO_HELPERS = "Do not create auxiliary or helper functions."
REMARK_SIGNATURE = "Maintain the original function's signature."
# -----------------------------------------------------------------------------

# DRAFT: the "context" condition. Built from failure modes reported in the
# paper (Sec. 5.1: undeclared builtins such as __builtin_add_overflow, Go
# compile-time overflow errors, renamed signatures) plus the arithmetic slips
# visible in the committed GPT-4o variants (operator precedence with shifts,
# bit width, signed division). Edit freely, but freeze it before the study.
CONTEXT_NOTES = """Known problems in previously generated substitutes for functions like this one. Avoid them:
- Bit width and signedness: keep every intermediate value in the same integer type and width as the reference. Do not widen, narrow or change signedness unless the reference does.
- Integer division and modulo truncate toward zero for negative operands, and right shifts of negative signed values are arithmetic. Do not replace / or % with shifts or masks unless the operand is provably non-negative.
- Overflow: unsigned arithmetic wraps; signed overflow is undefined in C, so do not introduce signed overflow the reference cannot have. In Go, constant expressions that overflow their type are compile errors.
- Operator precedence: in C, + and - bind tighter than << and >>. Parenthesise every shift.
- Do not call compiler builtins (__builtin_*), library functions or headers that the reference does not use; they are not available where the substitute is linked.
- Keep the exact function name and parameter types. Do not add suffixes such as _v1 or _alt."""

# Per-function feedback (e.g. compiler errors from a previous round) is
# appended after CONTEXT_NOTES when --feedback-dir is given.
FEEDBACK_HEADER = "Errors reported for earlier substitutes of this exact function:"

# DRAFT: the "chain-of-thought" condition. It replaces the "no other text"
# remark, so explanations must be kept out of the code blocks for the
# ingest step to parse the variants.
COT_INSTRUCTIONS = """For each substitute, first explain in a few sentences what you are changing and why the result still behaves exactly like the reference for every input (consider bit widths, signedness, overflow, and how division and shifts round). Then give that substitute in its own fenced code block. Keep explanations outside the code blocks; each code block must contain only the function."""

CONDITIONS = ("baseline", "context", "cot", "context_cot")


def build_prompt(code, input_lang="C", output_lang="C", n_variants=10, condition="baseline", feedback=None):
    if condition not in CONDITIONS:
        raise ValueError(f"unknown condition {condition!r}; choose from {CONDITIONS}")

    lang_opt = OUTPUT_LANG_OPT.replace('<OUTPUT>', output_lang) if input_lang != output_lang else ''
    intro = PROMPT_INTRO.replace('<INPUT>', input_lang)
    instructions = PROMPT_INSTRUCTIONS.replace('<NUMBER>', str(n_variants)).replace('<OUTPUT_LANG>', lang_opt)

    use_context = condition in ("context", "context_cot")
    use_cot = condition in ("cot", "context_cot")

    remarks = [REMARK_TYPES]
    if not use_cot:
        remarks.append(REMARK_CODE_ONLY)
    remarks += [REMARK_NO_HELPERS, REMARK_SIGNATURE]
    remarks = " ".join(remarks)

    parts = [intro, code, instructions]
    if use_context:
        ctx = CONTEXT_NOTES
        if feedback:
            ctx += "\n" + FEEDBACK_HEADER + "\n" + feedback.strip()
        parts.append(ctx)
    if use_cot:
        parts.append(COT_INSTRUCTIONS)
    parts.append(remarks)
    return "\n".join(parts)


if __name__ == "__main__":
    # Self-check: the baseline must equal what generate_variants.py builds.
    code = "static int mix(int c0, int c1)\n{\n    return c0;\n}"
    original = '\n'.join([
        'The following code is a reference implementeation of a function in C.',
        code,
        'Create 10 substitute implementation(s) of the function, which are different but equivalent . '
        'It should be possible to directly replace the function and it should provide the same functionality',
        "int in C is equal to int32 in Go. Do not output any other text apart from code. "
        "Do not create auxiliary or helper functions. Maintain the original function's signature.",
    ])
    assert build_prompt(code) == original, "baseline drifted from generate_variants.py"
    print("baseline prompt matches generate_variants.py")
    for c in CONDITIONS:
        print(f"\n===== {c} (C to Go) =====\n" + build_prompt(code, output_lang="Go", condition=c))
