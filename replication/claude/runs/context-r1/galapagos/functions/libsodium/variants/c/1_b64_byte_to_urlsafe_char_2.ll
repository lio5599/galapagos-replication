; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.c"
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
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i8, align 1
  %na = alloca i8, align 1
  %nb = alloca i8, align 1
  %d = alloca i8, align 1
  %e = alloca i8, align 1
  %r = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %conv = trunc i32 %shr to i8
  store i8 %conv, ptr %a, align 1
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %conv3 = trunc i32 %shr2 to i8
  store i8 %conv3, ptr %b, align 1
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %conv6 = trunc i32 %shr5 to i8
  store i8 %conv6, ptr %c, align 1
  %3 = load i8, ptr %a, align 1
  %conv7 = zext i8 %3 to i32
  %not = xor i32 %conv7, -1
  %conv8 = trunc i32 %not to i8
  store i8 %conv8, ptr %na, align 1
  %4 = load i8, ptr %b, align 1
  %conv9 = zext i8 %4 to i32
  %not10 = xor i32 %conv9, -1
  %conv11 = trunc i32 %not10 to i8
  store i8 %conv11, ptr %nb, align 1
  %5 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %5, 62
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  %conv14 = trunc i32 %shr13 to i8
  %conv15 = zext i8 %conv14 to i32
  %not16 = xor i32 %conv15, -1
  %conv17 = trunc i32 %not16 to i8
  store i8 %conv17, ptr %d, align 1
  %6 = load i32, ptr %x.addr, align 4
  %xor18 = xor i32 %6, 63
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %conv21 = trunc i32 %shr20 to i8
  %conv22 = zext i8 %conv21 to i32
  %not23 = xor i32 %conv22, -1
  %conv24 = trunc i32 %not23 to i8
  store i8 %conv24, ptr %e, align 1
  %7 = load i8, ptr %a, align 1
  %conv25 = zext i8 %7 to i32
  %8 = load i32, ptr %x.addr, align 4
  %add = add i32 %8, 65
  %and = and i32 %conv25, %add
  store i32 %and, ptr %r, align 4
  %9 = load i8, ptr %na, align 1
  %conv26 = zext i8 %9 to i32
  %10 = load i8, ptr %b, align 1
  %conv27 = zext i8 %10 to i32
  %and28 = and i32 %conv26, %conv27
  %11 = load i32, ptr %x.addr, align 4
  %add29 = add i32 %11, 71
  %and30 = and i32 %and28, %add29
  %12 = load i32, ptr %r, align 4
  %or = or i32 %12, %and30
  store i32 %or, ptr %r, align 4
  %13 = load i8, ptr %nb, align 1
  %conv31 = zext i8 %13 to i32
  %14 = load i8, ptr %c, align 1
  %conv32 = zext i8 %14 to i32
  %and33 = and i32 %conv31, %conv32
  %15 = load i32, ptr %x.addr, align 4
  %sub34 = sub i32 %15, 4
  %and35 = and i32 %and33, %sub34
  %16 = load i32, ptr %r, align 4
  %or36 = or i32 %16, %and35
  store i32 %or36, ptr %r, align 4
  %17 = load i8, ptr %d, align 1
  %conv37 = zext i8 %17 to i32
  %and38 = and i32 %conv37, 45
  %18 = load i32, ptr %r, align 4
  %or39 = or i32 %18, %and38
  store i32 %or39, ptr %r, align 4
  %19 = load i8, ptr %e, align 1
  %conv40 = zext i8 %19 to i32
  %and41 = and i32 %conv40, 95
  %20 = load i32, ptr %r, align 4
  %or42 = or i32 %20, %and41
  store i32 %or42, ptr %r, align 4
  %21 = load i32, ptr %r, align 4
  ret i32 %21
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
