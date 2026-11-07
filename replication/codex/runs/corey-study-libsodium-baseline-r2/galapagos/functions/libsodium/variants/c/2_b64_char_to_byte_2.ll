; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %or = or i32 %shr, %shr2
  store i32 %or, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %shr4 = lshr i32 %sub3, 8
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %4
  %shr6 = lshr i32 %sub5, 8
  %or7 = or i32 %shr4, %shr6
  store i32 %or7, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 %5, 48
  %shr9 = lshr i32 %sub8, 8
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 57, %6
  %shr11 = lshr i32 %sub10, 8
  %or12 = or i32 %shr9, %shr11
  store i32 %or12, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub13 = sub i32 0, %xor
  %shr14 = lshr i32 %sub13, 8
  store i32 %shr14, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor15 = xor i32 %8, 47
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  store i32 %shr17, ptr %s, align 4
  %9 = load i32, ptr %a, align 4
  %not = xor i32 %9, -1
  %10 = load i32, ptr %u, align 4
  %sub18 = sub i32 %10, 65
  %and = and i32 %not, %sub18
  %11 = load i32, ptr %b, align 4
  %not19 = xor i32 %11, -1
  %12 = load i32, ptr %u, align 4
  %sub20 = sub i32 %12, 71
  %and21 = and i32 %not19, %sub20
  %or22 = or i32 %and, %and21
  %13 = load i32, ptr %d, align 4
  %not23 = xor i32 %13, -1
  %14 = load i32, ptr %u, align 4
  %sub24 = sub i32 %14, -4
  %and25 = and i32 %not23, %sub24
  %or26 = or i32 %or22, %and25
  %15 = load i32, ptr %p, align 4
  %not27 = xor i32 %15, -1
  %and28 = and i32 %not27, 62
  %or29 = or i32 %or26, %and28
  %16 = load i32, ptr %s, align 4
  %not30 = xor i32 %16, -1
  %and31 = and i32 %not30, 63
  %or32 = or i32 %or29, %and31
  store i32 %or32, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %and33 = and i32 %17, 255
  store i32 %and33, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %18, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor34 = xor i32 %19, 65
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr36, 255
  store i32 %and37, ptr %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %20 = load i32, ptr %x, align 4
  ret i32 %20
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
