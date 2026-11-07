; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_8.c"
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
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %va = alloca i32, align 4
  %vb = alloca i32, align 4
  %vc = alloca i32, align 4
  %result = alloca i32, align 4
  %shift = alloca i32, align 4
  %ma = alloca i32, align 4
  %mb = alloca i32, align 4
  %mc = alloca i32, align 4
  %md = alloca i32, align 4
  %me = alloca i32, align 4
  %part = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 0, %xor
  %shr6 = lshr i32 %sub5, 8
  %not = xor i32 %shr6, -1
  store i32 %not, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  %not10 = xor i32 %shr9, -1
  store i32 %not10, ptr %e, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  store i32 %add, ptr %va, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add11 = add i32 %6, 71
  store i32 %add11, ptr %vb, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %7, -4
  store i32 %add12, ptr %vc, align 4
  store i32 0, ptr %result, align 4
  store i32 0, ptr %shift, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, ptr %shift, align 4
  %cmp = icmp ult i32 %8, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %shift, align 4
  %shr13 = lshr i32 %9, %10
  %and = and i32 %shr13, 15
  store i32 %and, ptr %ma, align 4
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %shift, align 4
  %shr14 = lshr i32 %11, %12
  %and15 = and i32 %shr14, 15
  store i32 %and15, ptr %mb, align 4
  %13 = load i32, ptr %c, align 4
  %14 = load i32, ptr %shift, align 4
  %shr16 = lshr i32 %13, %14
  %and17 = and i32 %shr16, 15
  store i32 %and17, ptr %mc, align 4
  %15 = load i32, ptr %d, align 4
  %16 = load i32, ptr %shift, align 4
  %shr18 = lshr i32 %15, %16
  %and19 = and i32 %shr18, 15
  store i32 %and19, ptr %md, align 4
  %17 = load i32, ptr %e, align 4
  %18 = load i32, ptr %shift, align 4
  %shr20 = lshr i32 %17, %18
  %and21 = and i32 %shr20, 15
  store i32 %and21, ptr %me, align 4
  %19 = load i32, ptr %ma, align 4
  %20 = load i32, ptr %va, align 4
  %21 = load i32, ptr %shift, align 4
  %shr22 = lshr i32 %20, %21
  %and23 = and i32 %19, %shr22
  %22 = load i32, ptr %ma, align 4
  %xor24 = xor i32 %22, 15
  %23 = load i32, ptr %mb, align 4
  %and25 = and i32 %xor24, %23
  %24 = load i32, ptr %vb, align 4
  %25 = load i32, ptr %shift, align 4
  %shr26 = lshr i32 %24, %25
  %and27 = and i32 %and25, %shr26
  %or = or i32 %and23, %and27
  %26 = load i32, ptr %mb, align 4
  %xor28 = xor i32 %26, 15
  %27 = load i32, ptr %mc, align 4
  %and29 = and i32 %xor28, %27
  %28 = load i32, ptr %vc, align 4
  %29 = load i32, ptr %shift, align 4
  %shr30 = lshr i32 %28, %29
  %and31 = and i32 %and29, %shr30
  %or32 = or i32 %or, %and31
  %30 = load i32, ptr %md, align 4
  %31 = load i32, ptr %shift, align 4
  %shr33 = lshr i32 43, %31
  %and34 = and i32 %30, %shr33
  %or35 = or i32 %or32, %and34
  %32 = load i32, ptr %me, align 4
  %33 = load i32, ptr %shift, align 4
  %shr36 = lshr i32 47, %33
  %and37 = and i32 %32, %shr36
  %or38 = or i32 %or35, %and37
  store i32 %or38, ptr %part, align 4
  %34 = load i32, ptr %part, align 4
  %35 = load i32, ptr %shift, align 4
  %shl = shl i32 %34, %35
  %36 = load i32, ptr %result, align 4
  %or39 = or i32 %36, %shl
  store i32 %or39, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %37 = load i32, ptr %shift, align 4
  %add40 = add i32 %37, 4
  store i32 %add40, ptr %shift, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %38 = load i32, ptr %result, align 4
  ret i32 %38
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
