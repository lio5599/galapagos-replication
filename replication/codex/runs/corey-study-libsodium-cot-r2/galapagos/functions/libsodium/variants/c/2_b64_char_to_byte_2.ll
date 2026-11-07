; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %mask = alloca [5 x i32], align 16
  %value = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %mask, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %xor4 = xor i32 255, %and3
  %and5 = and i32 %xor, %xor4
  store i32 %and5, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 97
  %shr7 = lshr i32 %sub6, 8
  %and8 = and i32 %shr7, 255
  %xor9 = xor i32 255, %and8
  %4 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %4
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %xor13 = xor i32 255, %and12
  %and14 = and i32 %xor9, %xor13
  store i32 %and14, ptr %arrayinit.element, align 4
  %arrayinit.element15 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %u, align 4
  %sub16 = sub i32 %5, 48
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %xor19 = xor i32 255, %and18
  %6 = load i32, ptr %u, align 4
  %sub20 = sub i32 57, %6
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %xor23 = xor i32 255, %and22
  %and24 = and i32 %xor19, %xor23
  store i32 %and24, ptr %arrayinit.element15, align 4
  %arrayinit.element25 = getelementptr inbounds i32, ptr %arrayinit.element15, i64 1
  %7 = load i32, ptr %u, align 4
  %xor26 = xor i32 %7, 43
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  %xor30 = xor i32 255, %and29
  store i32 %xor30, ptr %arrayinit.element25, align 4
  %arrayinit.element31 = getelementptr inbounds i32, ptr %arrayinit.element25, i64 1
  %8 = load i32, ptr %u, align 4
  %xor32 = xor i32 %8, 47
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  %xor36 = xor i32 255, %and35
  store i32 %xor36, ptr %arrayinit.element31, align 4
  %arrayinit.begin37 = getelementptr inbounds [5 x i32], ptr %value, i64 0, i64 0
  %9 = load i32, ptr %u, align 4
  %sub38 = sub i32 %9, 65
  store i32 %sub38, ptr %arrayinit.begin37, align 4
  %arrayinit.element39 = getelementptr inbounds i32, ptr %arrayinit.begin37, i64 1
  %10 = load i32, ptr %u, align 4
  %sub40 = sub i32 %10, 97
  %add = add i32 %sub40, 26
  store i32 %add, ptr %arrayinit.element39, align 4
  %arrayinit.element41 = getelementptr inbounds i32, ptr %arrayinit.element39, i64 1
  %11 = load i32, ptr %u, align 4
  %sub42 = sub i32 %11, 48
  %add43 = add i32 %sub42, 52
  store i32 %add43, ptr %arrayinit.element41, align 4
  %arrayinit.element44 = getelementptr inbounds i32, ptr %arrayinit.element41, i64 1
  store i32 62, ptr %arrayinit.element44, align 4
  %arrayinit.element45 = getelementptr inbounds i32, ptr %arrayinit.element44, i64 1
  store i32 63, ptr %arrayinit.element45, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %mask, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom46 = zext i32 %15 to i64
  %arrayidx47 = getelementptr inbounds [5 x i32], ptr %value, i64 0, i64 %idxprom46
  %16 = load i32, ptr %arrayidx47, align 4
  %and48 = and i32 %14, %16
  %17 = load i32, ptr %x, align 4
  %or = or i32 %17, %and48
  store i32 %or, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %sub49 = sub i32 0, %20
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  %xor52 = xor i32 255, %and51
  %21 = load i32, ptr %u, align 4
  %xor53 = xor i32 %21, 65
  %sub54 = sub i32 0, %xor53
  %shr55 = lshr i32 %sub54, 8
  %and56 = and i32 %shr55, 255
  %and57 = and i32 %xor52, %and56
  %or58 = or i32 %19, %and57
  ret i32 %or58
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
