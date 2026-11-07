; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  %ab = alloca i32, align 4
  %bb = alloca i32, align 4
  %sum = alloca i32, align 4
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
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  store i32 %xor10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %e, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  store i32 %add, ptr %upper, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %6, 71
  store i32 %add16, ptr %lower, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add17 = add i32 %7, -4
  store i32 %add17, ptr %digit, align 4
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %8, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %i, align 4
  %shr18 = lshr i32 %9, %10
  %and19 = and i32 %shr18, 1
  store i32 %and19, ptr %ab, align 4
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %i, align 4
  %shr20 = lshr i32 %11, %12
  %and21 = and i32 %shr20, 1
  store i32 %and21, ptr %bb, align 4
  %13 = load i32, ptr %ab, align 4
  %14 = load i32, ptr %upper, align 4
  %15 = load i32, ptr %i, align 4
  %shr22 = lshr i32 %14, %15
  %and23 = and i32 %shr22, 1
  %mul = mul i32 %13, %and23
  %16 = load i32, ptr %ab, align 4
  %sub24 = sub i32 1, %16
  %17 = load i32, ptr %bb, align 4
  %mul25 = mul i32 %sub24, %17
  %18 = load i32, ptr %lower, align 4
  %19 = load i32, ptr %i, align 4
  %shr26 = lshr i32 %18, %19
  %and27 = and i32 %shr26, 1
  %mul28 = mul i32 %mul25, %and27
  %add29 = add i32 %mul, %mul28
  %20 = load i32, ptr %bb, align 4
  %sub30 = sub i32 1, %20
  %21 = load i32, ptr %c, align 4
  %22 = load i32, ptr %i, align 4
  %shr31 = lshr i32 %21, %22
  %and32 = and i32 %shr31, 1
  %mul33 = mul i32 %sub30, %and32
  %23 = load i32, ptr %digit, align 4
  %24 = load i32, ptr %i, align 4
  %shr34 = lshr i32 %23, %24
  %and35 = and i32 %shr34, 1
  %mul36 = mul i32 %mul33, %and35
  %add37 = add i32 %add29, %mul36
  %25 = load i32, ptr %d, align 4
  %26 = load i32, ptr %i, align 4
  %shr38 = lshr i32 %25, %26
  %and39 = and i32 %shr38, 1
  %27 = load i32, ptr %i, align 4
  %shr40 = lshr i32 45, %27
  %and41 = and i32 %shr40, 1
  %mul42 = mul i32 %and39, %and41
  %add43 = add i32 %add37, %mul42
  %28 = load i32, ptr %e, align 4
  %29 = load i32, ptr %i, align 4
  %shr44 = lshr i32 %28, %29
  %and45 = and i32 %shr44, 1
  %30 = load i32, ptr %i, align 4
  %shr46 = lshr i32 95, %30
  %and47 = and i32 %shr46, 1
  %mul48 = mul i32 %and45, %and47
  %add49 = add i32 %add43, %mul48
  store i32 %add49, ptr %sum, align 4
  %31 = load i32, ptr %sum, align 4
  %cmp50 = icmp ne i32 %31, 0
  %conv = zext i1 %cmp50 to i32
  %32 = load i32, ptr %i, align 4
  %shl = shl i32 %conv, %32
  %33 = load i32, ptr %result, align 4
  %or = or i32 %33, %shl
  store i32 %or, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %34 = load i32, ptr %i, align 4
  %inc = add i32 %34, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %35 = load i32, ptr %result, align 4
  ret i32 %35
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
