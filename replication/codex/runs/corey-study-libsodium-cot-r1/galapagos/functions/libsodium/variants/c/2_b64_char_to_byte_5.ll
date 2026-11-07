; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %m = alloca [9 x i32], align 16
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  store i32 %sub1, ptr %arrayinit.element, align 4
  %arrayinit.element2 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  store i32 %sub3, ptr %arrayinit.element2, align 4
  %arrayinit.element4 = getelementptr inbounds i32, ptr %arrayinit.element2, i64 1
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %4
  store i32 %sub5, ptr %arrayinit.element4, align 4
  %arrayinit.element6 = getelementptr inbounds i32, ptr %arrayinit.element4, i64 1
  %5 = load i32, ptr %u, align 4
  %sub7 = sub i32 %5, 48
  store i32 %sub7, ptr %arrayinit.element6, align 4
  %arrayinit.element8 = getelementptr inbounds i32, ptr %arrayinit.element6, i64 1
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 57, %6
  store i32 %sub9, ptr %arrayinit.element8, align 4
  %arrayinit.element10 = getelementptr inbounds i32, ptr %arrayinit.element8, i64 1
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub11 = sub i32 0, %xor
  store i32 %sub11, ptr %arrayinit.element10, align 4
  %arrayinit.element12 = getelementptr inbounds i32, ptr %arrayinit.element10, i64 1
  %8 = load i32, ptr %u, align 4
  %xor13 = xor i32 %8, 47
  %sub14 = sub i32 0, %xor13
  store i32 %sub14, ptr %arrayinit.element12, align 4
  %arrayinit.element15 = getelementptr inbounds i32, ptr %arrayinit.element12, i64 1
  %9 = load i32, ptr %u, align 4
  %xor16 = xor i32 %9, 65
  %sub17 = sub i32 0, %xor16
  store i32 %sub17, ptr %arrayinit.element15, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %10, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32, ptr %i, align 4
  %idxprom = zext i32 %11 to i64
  %arrayidx = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 %idxprom
  %12 = load i32, ptr %arrayidx, align 4
  %shr = lshr i32 %12, 8
  %and = and i32 %shr, 255
  %xor18 = xor i32 255, %and
  %13 = load i32, ptr %i, align 4
  %idxprom19 = zext i32 %13 to i64
  %arrayidx20 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 %idxprom19
  store i32 %xor18, ptr %arrayidx20, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx21 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 0
  %15 = load i32, ptr %arrayidx21, align 16
  %arrayidx22 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 1
  %16 = load i32, ptr %arrayidx22, align 4
  %and23 = and i32 %15, %16
  %17 = load i32, ptr %u, align 4
  %sub24 = sub i32 %17, 65
  %and25 = and i32 %and23, %sub24
  %arrayidx26 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 2
  %18 = load i32, ptr %arrayidx26, align 8
  %arrayidx27 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 3
  %19 = load i32, ptr %arrayidx27, align 4
  %and28 = and i32 %18, %19
  %20 = load i32, ptr %u, align 4
  %sub29 = sub i32 %20, 97
  %add = add i32 %sub29, 26
  %and30 = and i32 %and28, %add
  %or = or i32 %and25, %and30
  %arrayidx31 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 4
  %21 = load i32, ptr %arrayidx31, align 16
  %arrayidx32 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 5
  %22 = load i32, ptr %arrayidx32, align 4
  %and33 = and i32 %21, %22
  %23 = load i32, ptr %u, align 4
  %sub34 = sub i32 %23, 48
  %add35 = add i32 %sub34, 52
  %and36 = and i32 %and33, %add35
  %or37 = or i32 %or, %and36
  %arrayidx38 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 6
  %24 = load i32, ptr %arrayidx38, align 8
  %and39 = and i32 %24, 62
  %or40 = or i32 %or37, %and39
  %arrayidx41 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 7
  %25 = load i32, ptr %arrayidx41, align 4
  %and42 = and i32 %25, 63
  %or43 = or i32 %or40, %and42
  store i32 %or43, ptr %x, align 4
  %26 = load i32, ptr %x, align 4
  %27 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %27
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  %xor47 = xor i32 255, %and46
  %arrayidx48 = getelementptr inbounds [9 x i32], ptr %m, i64 0, i64 8
  %28 = load i32, ptr %arrayidx48, align 16
  %xor49 = xor i32 %28, 255
  %and50 = and i32 %xor47, %xor49
  %or51 = or i32 %26, %and50
  ret i32 %or51
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
