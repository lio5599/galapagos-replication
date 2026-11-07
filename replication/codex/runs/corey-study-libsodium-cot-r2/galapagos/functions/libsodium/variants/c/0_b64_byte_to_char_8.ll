; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %terms = alloca [5 x i32], align 16
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  %2 = load i32, ptr %a, align 4
  %3 = load i32, ptr %x.addr, align 4
  %add = add i32 %3, 65
  %and4 = and i32 %2, %add
  store i32 %and4, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %4 = load i32, ptr %a, align 4
  %xor = xor i32 %4, 255
  %5 = load i32, ptr %b, align 4
  %and5 = and i32 %xor, %5
  %6 = load i32, ptr %x.addr, align 4
  %add6 = add i32 %6, 71
  %and7 = and i32 %and5, %add6
  store i32 %and7, ptr %arrayinit.element, align 4
  %arrayinit.element8 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %7 = load i32, ptr %b, align 4
  %xor9 = xor i32 %7, 255
  %8 = load i32, ptr %x.addr, align 4
  %sub10 = sub i32 %8, 62
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %and13 = and i32 %xor9, %and12
  %9 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %9, -4
  %and15 = and i32 %and13, %add14
  store i32 %and15, ptr %arrayinit.element8, align 4
  %arrayinit.element16 = getelementptr inbounds i32, ptr %arrayinit.element8, i64 1
  %10 = load i32, ptr %x.addr, align 4
  %xor17 = xor i32 %10, 62
  %sub18 = sub i32 0, %xor17
  %shr19 = lshr i32 %sub18, 8
  %and20 = and i32 %shr19, 255
  %xor21 = xor i32 %and20, 255
  %and22 = and i32 %xor21, 43
  store i32 %and22, ptr %arrayinit.element16, align 4
  %arrayinit.element23 = getelementptr inbounds i32, ptr %arrayinit.element16, i64 1
  %11 = load i32, ptr %x.addr, align 4
  %xor24 = xor i32 %11, 63
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %xor28 = xor i32 %and27, 255
  %and29 = and i32 %xor28, 47
  store i32 %and29, ptr %arrayinit.element23, align 4
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx, align 4
  %15 = load i32, ptr %result, align 4
  %not = xor i32 %15, -1
  %and30 = and i32 %14, %not
  %16 = load i32, ptr %result, align 4
  %xor31 = xor i32 %16, %and30
  store i32 %xor31, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, ptr %i, align 4
  %inc = add i32 %17, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %18 = load i32, ptr %result, align 4
  ret i32 %18
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
