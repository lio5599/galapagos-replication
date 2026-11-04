; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.c"
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
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  %t5 = alloca i32, align 4
  %r = alloca i32, align 4
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
  %sub10 = sub i32 255, %and9
  store i32 %sub10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %sub15 = sub i32 255, %and14
  store i32 %sub15, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %sub16 = sub i32 255, %5
  %6 = load i32, ptr %b, align 4
  %and17 = and i32 %sub16, %6
  %7 = load i32, ptr %x.addr, align 4
  %add = add i32 %7, 71
  %and18 = and i32 %and17, %add
  store i32 %and18, ptr %t2, align 4
  %8 = load i32, ptr %b, align 4
  %sub19 = sub i32 255, %8
  %9 = load i32, ptr %c, align 4
  %and20 = and i32 %sub19, %9
  %10 = load i32, ptr %x.addr, align 4
  %sub21 = sub i32 %10, 4
  %and22 = and i32 %and20, %sub21
  store i32 %and22, ptr %t3, align 4
  %11 = load i32, ptr %d, align 4
  %and23 = and i32 %11, 45
  store i32 %and23, ptr %t4, align 4
  %12 = load i32, ptr %e, align 4
  %and24 = and i32 %12, 95
  store i32 %and24, ptr %t5, align 4
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %14, 65
  %and26 = and i32 %13, %add25
  store i32 %and26, ptr %r, align 4
  %15 = load i32, ptr %r, align 4
  %16 = load i32, ptr %t2, align 4
  %add27 = add i32 %15, %16
  %17 = load i32, ptr %r, align 4
  %18 = load i32, ptr %t2, align 4
  %and28 = and i32 %17, %18
  %sub29 = sub i32 %add27, %and28
  store i32 %sub29, ptr %r, align 4
  %19 = load i32, ptr %r, align 4
  %20 = load i32, ptr %t3, align 4
  %add30 = add i32 %19, %20
  %21 = load i32, ptr %r, align 4
  %22 = load i32, ptr %t3, align 4
  %and31 = and i32 %21, %22
  %sub32 = sub i32 %add30, %and31
  store i32 %sub32, ptr %r, align 4
  %23 = load i32, ptr %r, align 4
  %24 = load i32, ptr %t4, align 4
  %add33 = add i32 %23, %24
  %25 = load i32, ptr %r, align 4
  %26 = load i32, ptr %t4, align 4
  %and34 = and i32 %25, %26
  %sub35 = sub i32 %add33, %and34
  store i32 %sub35, ptr %r, align 4
  %27 = load i32, ptr %r, align 4
  %28 = load i32, ptr %t5, align 4
  %add36 = add i32 %27, %28
  %29 = load i32, ptr %r, align 4
  %30 = load i32, ptr %t5, align 4
  %and37 = and i32 %29, %30
  %sub38 = sub i32 %add36, %and37
  store i32 %sub38, ptr %r, align 4
  %31 = load i32, ptr %r, align 4
  ret i32 %31
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
