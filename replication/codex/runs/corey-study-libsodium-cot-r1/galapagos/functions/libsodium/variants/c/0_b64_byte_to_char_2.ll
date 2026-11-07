; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
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
  %i = alloca i32, align 4
  %ma = alloca i32, align 4
  %mb = alloca i32, align 4
  %mc = alloca i32, align 4
  %md = alloca i32, align 4
  %me = alloca i32, align 4
  %bit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  store i32 %sub, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  store i32 %sub1, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 62
  store i32 %sub2, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub3 = sub i32 0, %xor
  store i32 %sub3, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor4 = xor i32 %4, 63
  %sub5 = sub i32 0, %xor4
  store i32 %sub5, ptr %e, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  store i32 %add, ptr %va, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add6 = add i32 %6, 71
  store i32 %add6, ptr %vb, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add7 = add i32 %7, -4
  store i32 %add7, ptr %vc, align 4
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
  %add8 = add i32 %10, 8
  %shr = lshr i32 %9, %add8
  %and = and i32 %shr, 1
  store i32 %and, ptr %ma, align 4
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %i, align 4
  %add9 = add i32 %12, 8
  %shr10 = lshr i32 %11, %add9
  %and11 = and i32 %shr10, 1
  store i32 %and11, ptr %mb, align 4
  %13 = load i32, ptr %c, align 4
  %14 = load i32, ptr %i, align 4
  %add12 = add i32 %14, 8
  %shr13 = lshr i32 %13, %add12
  %and14 = and i32 %shr13, 1
  store i32 %and14, ptr %mc, align 4
  %15 = load i32, ptr %d, align 4
  %16 = load i32, ptr %i, align 4
  %add15 = add i32 %16, 8
  %shr16 = lshr i32 %15, %add15
  %and17 = and i32 %shr16, 1
  %xor18 = xor i32 %and17, 1
  store i32 %xor18, ptr %md, align 4
  %17 = load i32, ptr %e, align 4
  %18 = load i32, ptr %i, align 4
  %add19 = add i32 %18, 8
  %shr20 = lshr i32 %17, %add19
  %and21 = and i32 %shr20, 1
  %xor22 = xor i32 %and21, 1
  store i32 %xor22, ptr %me, align 4
  %19 = load i32, ptr %ma, align 4
  %20 = load i32, ptr %va, align 4
  %21 = load i32, ptr %i, align 4
  %shr23 = lshr i32 %20, %21
  %and24 = and i32 %19, %shr23
  %22 = load i32, ptr %ma, align 4
  %xor25 = xor i32 %22, 1
  %23 = load i32, ptr %mb, align 4
  %and26 = and i32 %xor25, %23
  %24 = load i32, ptr %vb, align 4
  %25 = load i32, ptr %i, align 4
  %shr27 = lshr i32 %24, %25
  %and28 = and i32 %and26, %shr27
  %or = or i32 %and24, %and28
  %26 = load i32, ptr %mb, align 4
  %xor29 = xor i32 %26, 1
  %27 = load i32, ptr %mc, align 4
  %and30 = and i32 %xor29, %27
  %28 = load i32, ptr %vc, align 4
  %29 = load i32, ptr %i, align 4
  %shr31 = lshr i32 %28, %29
  %and32 = and i32 %and30, %shr31
  %or33 = or i32 %or, %and32
  %30 = load i32, ptr %md, align 4
  %31 = load i32, ptr %i, align 4
  %shr34 = lshr i32 43, %31
  %and35 = and i32 %30, %shr34
  %or36 = or i32 %or33, %and35
  %32 = load i32, ptr %me, align 4
  %33 = load i32, ptr %i, align 4
  %shr37 = lshr i32 47, %33
  %and38 = and i32 %32, %shr37
  %or39 = or i32 %or36, %and38
  store i32 %or39, ptr %bit, align 4
  %34 = load i32, ptr %bit, align 4
  %35 = load i32, ptr %i, align 4
  %shl = shl i32 %34, %35
  %36 = load i32, ptr %result, align 4
  %or40 = or i32 %36, %shl
  store i32 %or40, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %37 = load i32, ptr %i, align 4
  %inc = add i32 %37, 1
  store i32 %inc, ptr %i, align 4
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
