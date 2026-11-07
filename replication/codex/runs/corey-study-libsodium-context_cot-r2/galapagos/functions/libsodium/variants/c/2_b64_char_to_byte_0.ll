; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
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
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor = xor i32 %and, 255
  store i32 %xor, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %xor4 = xor i32 %and3, 255
  store i32 %xor4, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub5 = sub i32 %3, 97
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  %xor8 = xor i32 %and7, 255
  store i32 %xor8, ptr %d, align 4
  %4 = load i32, ptr %u, align 4
  %sub9 = sub i32 122, %4
  %shr10 = lshr i32 %sub9, 8
  %and11 = and i32 %shr10, 255
  %xor12 = xor i32 %and11, 255
  store i32 %xor12, ptr %e, align 4
  %5 = load i32, ptr %u, align 4
  %sub13 = sub i32 %5, 48
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  store i32 %xor16, ptr %f, align 4
  %6 = load i32, ptr %u, align 4
  %sub17 = sub i32 57, %6
  %shr18 = lshr i32 %sub17, 8
  %and19 = and i32 %shr18, 255
  %xor20 = xor i32 %and19, 255
  store i32 %xor20, ptr %g, align 4
  %7 = load i32, ptr %u, align 4
  %xor21 = xor i32 %7, 43
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 %and24, 255
  store i32 %xor25, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor26 = xor i32 %8, 47
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  %xor30 = xor i32 %and29, 255
  store i32 %xor30, ptr %q, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %b, align 4
  %and31 = and i32 %9, %10
  %11 = load i32, ptr %u, align 4
  %sub32 = sub i32 %11, 65
  %and33 = and i32 %and31, %sub32
  %12 = load i32, ptr %d, align 4
  %13 = load i32, ptr %e, align 4
  %and34 = and i32 %12, %13
  %14 = load i32, ptr %u, align 4
  %sub35 = sub i32 %14, 97
  %add = add i32 %sub35, 26
  %and36 = and i32 %and34, %add
  %or = or i32 %and33, %and36
  %15 = load i32, ptr %f, align 4
  %16 = load i32, ptr %g, align 4
  %and37 = and i32 %15, %16
  %17 = load i32, ptr %u, align 4
  %sub38 = sub i32 %17, 48
  %add39 = add i32 %sub38, 52
  %and40 = and i32 %and37, %add39
  %or41 = or i32 %or, %and40
  %18 = load i32, ptr %p, align 4
  %and42 = and i32 %18, 62
  %or43 = or i32 %or41, %and42
  %19 = load i32, ptr %q, align 4
  %and44 = and i32 %19, 63
  %or45 = or i32 %or43, %and44
  store i32 %or45, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %21 = load i32, ptr %x, align 4
  %sub46 = sub i32 0, %21
  %shr47 = lshr i32 %sub46, 8
  %and48 = and i32 %shr47, 255
  %xor49 = xor i32 %and48, 255
  %22 = load i32, ptr %u, align 4
  %xor50 = xor i32 %22, 65
  %sub51 = sub i32 0, %xor50
  %shr52 = lshr i32 %sub51, 8
  %and53 = and i32 %shr52, 255
  %and54 = and i32 %xor49, %and53
  %or55 = or i32 %20, %and54
  ret i32 %or55
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
